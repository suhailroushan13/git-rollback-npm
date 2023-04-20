const { execSync } = require('child_process');

execSync('git pull origin master');
execSync('git log --oneline > log.txt');
execSync('git log --oneline | sed -n \'2p\' > log.txt');
const vars = execSync('cat log.txt | head -n1 | awk \'{print $1;}\'').toString();
console.log(vars + ' Is your previous Commit ID');
execSync('git reset ' + vars);
execSync('git reset --soft HEAD@{1}');
execSync('git commit -m "Revert"');
execSync('git reset --hard');
execSync('git push -f');
console.log('Done');
