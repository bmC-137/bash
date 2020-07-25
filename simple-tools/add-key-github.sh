function github_add_ssh_key () {
  read -p "email : " commentemail
  echo "$commentemail"
  if [ ! -f ~/.ssh/id_ecdsa-new ]; then
    ssh-keygen -t ecdsa -b 521 -C "$email"
    ssh-add ~/.ssh/id_ecdsa
  fi
  pub=`cat ~/.ssh/id_ecdsa-new.pub`
  read -p "username: " gituser
  echo "username: $gituser"
  read -s -p "Github password: " gitpass
  echo
  read -p "OTP: " otp
  echo "otp: $otp"
  echo
  confirm
  curl -u "$gituser:$gitpass" -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" --header "x-github-otp: $otp" https://api.github.com/user/keys
}

