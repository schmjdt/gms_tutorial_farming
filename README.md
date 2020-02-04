GameMaker Studio 2 Farming RPG Tutorial

Following along with [Farming RPG Tutorial: GMS2](https://www.youtube.com/playlist?list=PLSFMekK0JFgzbFfj1vAsyluKTymnBiriY) by [FriendlyCosmonaut](https://www.youtube.com/channel/UCKCKHxkH8zqV9ltWZw0JFig)



Workflow >>>
```
*start new tutorial video*
*create branch locally*
git checkout -b ep#
*push branch to repo*
git push --set-upstream origin ep# 

*make changes/commits*
git commit -m "change"
git push
*repeat above as many times as needed*

*tutorial video complete - squash before merging to master*
git checkout master
git merge ep#
git rebase -i HEAD~#
	pick	(earliest commit)
	squash
	...
	squash	(latest commit)
>wq
	*Remove all commit messages and put*
    "Complete ep# of tutorial"
>wq
git push
```
