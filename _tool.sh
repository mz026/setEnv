function white()
{
  echo -e "\033[1;37;40m $1 \033[0m";
}
function green()
{
  echo -e "\033[1;32;40m $1 \033[0m";
}
function red()
{
  echo -e "\033[1;31;40m $1 \033[0m";
}

function aptInstall()
{
  white "now installing $1 ...";
  if sudo apt-get install $1; then
    green "install $1 ok!";
  else
    red "install $1 failed...";
    exit 1;
  fi
}

function aptUpdate()
{
  white "updating apt..."
  if sudo apt-get update; then
    green "update apt ok."
  else
    red "update apt failed."
    exit 1;
  fi
}
