#!/bin/bash
:<<!
# Usage(Push the local change to the server):
        ./$0

# Help:
        Maybe there are some errors when you push the code firstly,then you can
        exec with the notice step by step.

# The error is:
Total 10 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2)
remote: Processing changes: refs: 1, done
remote: ERROR: missing Change-Id in commit message footer
remote:
remote: Hint: To automatically insert Change-Id, install the hook:
remote:   gitdir=$(git rev-parse --git-dir); scp -p -P 29418 yuhua.wang@review1-sh.sim.com:hooks/commit-msg .git/hooks/
remote: And then amend the commit:
remote:   git commit --amend
remote:
To ssh://yuhua.wang@review1-sh.sim.com:29418/SZ-Repositories/MTK_AX1800
 ! [remote rejected] HEAD -> refs/for/master (missing Change-Id in commit message footer)
error: 无法推送一些引用到 'ssh://yuhua.wang@review1-sh.sim.com:29418/SZ-Repositories/MTK_AX1800.git'

# You can do like this(Please replace the name with yours):
1) gitdir=$(git rev-parse --git-dir); scp -p -P 29418 $branch@review1-sh.sim.com:hooks/commit-msg .git/hooks/
2) git commit --amend
3) save and push again
!

function help_msg(){
	echo -e "The remote branches are:"
	echo -e "\t 1) pull -- sync code from server"
	echo -e "\t 2) push -- push your commit to server"
}

real_name=`git config --list | grep user.email | awk -F "=" {'print $2'} | awk -F "@" '{print $1}'`
branch=SZ-WIFI-BACKED

read -p "Please input the remote branch[1:pull  2:push]:" SYNC_STATUS
if  [ x"$SYNC_STATUS" = x"" ]; then
	help_msg

elif [ x"$SYNC_STATUS" = x"pull" ] || [ x"$SYNC_STATUS" = x"1" ]; then
	git pull origin $branch

elif [ x"$SYNC_STATUS" = x"push" ] || [ x"$SYNC_STATUS" = x"2" ]; then
	git push ssh://${real_name}@review1-sh.sim.com:29418/SZ-Repositories/wifi-upgrade HEAD:refs/for/$branch

else
	echo -e "\t Error!! Please ensure git_status that you want"
fi
