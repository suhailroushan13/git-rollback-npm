GREEN='\033[0;32m'
RESET='\033[0m'

cd ~bin
sudo touch rollback
sudo chmod 777 rollback
echo -e "git pull origin master\nvar=\$(git log --pretty=format:'%h' -n 2 | tail -n 1)\necho \$var \"Is your previous Commit ID\"\ngit reset \$var\ngit reset --soft HEAD@{1}\ngit commit -m \"Revert\"\ngit reset --hard\ngit push -f\necho \"Rollback has been successfully completed.\"" > rollback
echo -e "Just Type ${GREEN}rollback${RESET} to Get RollBacked To Your Previous Commit On GitHub"
