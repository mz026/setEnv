#!/usr/bin/env ruby

class AWSSetter
  HOME = ENV['HOME']
  AUTOSCALING_SRC_LINK = 
    "http://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip"
  CLOUDWATCH_SRC_LINK = 
    "http://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip"

  def initialize
    @root_dir = "#{HOME}/.aws"
    @key_file = "#{@root_dir}/aws.key"
    @bash_file = "#{@root_dir}/aws.bash"
    @pwd = File.dirname(__FILE__)
    @temp_dir = "#{@pwd}/.aws_tmp"
    setup_java_home
  end

  def setup_java_home
    java_path = `which java`
    raise Exception, 
      "java is required to install AWS command line tool." if java_path.empty?
    @java_home = java_path.gsub('/bin/java', '')
  end

  def set
    create_root_dir 
    setup_bash
    create_key_template
    install_commandline_tool AUTOSCALING_SRC_LINK, "autoscaling"
    install_commandline_tool CLOUDWATCH_SRC_LINK, "cloudwatch"
  end

  
  def create_root_dir
    `mkdir -p #{@root_dir}`
  end

  def create_key_template
    return if File.exists?(@key_file)
    key_template = <<-TEMPLATE
AWSAccessKeyId=<your access key id>
AWSSecretKey=<your access key>
    TEMPLATE

    File.open(@key_file, 'a+') do |file|
      file.write(key_template)
    end

    File.open(@bash_file, 'a+') do |file|
      file.write("export AWS_CREDENTIAL_FILE=#{@key_file}");
    end
  end

  def setup_bash
    create_bash
    write_java_home
  end
  def create_bash
    `touch #{@bash_file}` unless File.exists?(@bash_file)
  end
  def write_java_home
    File.open(@bash_file, 'a+') do |file|
      file.write("export JAVA_HOME=#{@java_home}")
    end
  end

  def install_commandline_tool src_link, keyword
    make_temp_dir
    download_src_to_temp src_link
    unzip_to_aws_root keyword
    remove_temp_dir
    write_setting_in_bash keyword
  end

  
  def make_temp_dir
    `mkdir #{@temp_dir}` unless Dir.exists?(@temp_dir)
  end

  def download_src_to_temp src_link
    `wget -P #{@temp_dir} #{src_link}`
  end

  def unzip_to_aws_root keyword
    file = find_file @temp_dir, keyword
    `unzip -d #{@root_dir} #{file}`
  end

  def find_file dir, keyword
    file = nil
    Dir["#{dir}/*"].each do |file_in_dir|
      file_in_dir = file_in_dir.gsub(dir, '')
      file = File.join(dir, file_in_dir) if file_in_dir.downcase.match(keyword)
    end
    File.absolute_path(file)
  end

  def remove_temp_dir
    `rm -rf #{@temp_dir}`
  end

  def write_setting_in_bash keyword
    src_path = find_file @root_dir, keyword

    case keyword
    when 'autoscaling'
      bash_settings = <<-SETTING

export AWS_AUTO_SCALING_HOME=#{src_path}
export AWS_AUTO_SCALING_URL=https://autoscaling.ap-southeast-1.amazonaws.com
export PATH=$PATH:$AWS_AUTO_SCALING_HOME/bin

      SETTING
    when 'cloudwatch'
      bash_settings = <<-SETTING

export AWS_CLOUDWATCH_HOME=#{src_path}
export AWS_CLOUDWATCH_URL=https://monitoring.ap-southeast-1.amazonaws.com  
export PATH=$PATH:$AWS_CLOUDWATCH_HOME/bin

      SETTING
    end
    
    File.open(@bash_file, 'a+') do |file|
      file.write(bash_settings)
    end

  end
end

setter = AWSSetter.new
setter.set
