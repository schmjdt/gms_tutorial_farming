GameMaker Studio 2 Farming RPG Tutorial

Following along with [Farming RPG Tutorial: GMS2](https://www.youtube.com/playlist?list=PLSFMekK0JFgzbFfj1vAsyluKTymnBiriY) by [FriendlyCosmonaut](https://www.youtube.com/channel/UCKCKHxkH8zqV9ltWZw0JFig)



Workflow >>>
```
*start new tutorial video*
*create branch locally*
git checkout -b ep#
*push branch to repo*
git push --set-upstream origin ep# 

*make changes in GameMaker Studio*
Source Control -> Commit Changes -> Stage All/Wanted -> Add Commit Message -> Commit
*back on command line*
git push
*repeat above as many times as needed*

*tutorial video complete - create temporary branch to squash before merging to master*
git checkout -b tmp
git rebase -i master
	pick	(earliest commit)
	squash
	...
	squash	(latest commit)
>wq
	*Remove all commit messages and put*
    "Complete ep# of tutorial"
>wq
*switch to master and merge*
git checkout master
git merge tmp
git branch -d tmp
git push
```
