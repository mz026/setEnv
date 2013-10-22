#!/usr/bin/env ruby

current_dir = File.expand_path(File.dirname(__FILE__))
temp_dir = "#{current_dir}/temp_tmux_dir"
temp_file_name = "#{temp_dir}/#{Time.now.to_i.to_s}"

`mkdir -p #{temp_dir}`

Dir.chdir(temp_dir) do
  system "sudo apt-get install -y libevent-1.4 libevent-dev libncurses5-dev"
  system "wget http://downloads.sourceforge.net/tmux/tmux-1.8.tar.gz -O #{temp_file_name}"
  system "tar -zxvf #{temp_file_name}"
  system "cd tmux-1.8 && ./configure && make && sudo make install"
end

system "rm -rf #{temp_dir}"
