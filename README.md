GameMaker Studio 2 Farming RPG Tutorial

Following along with [Farming RPG Tutorial: GMS2](https://www.youtube.com/playlist?list=PLSFMekK0JFgzbFfj1vAsyluKTymnBiriY) by [FriendlyCosmonaut](https://www.youtube.com/channel/UCKCKHxkH8zqV9ltWZw0JFig)



Workflow >>>

*start new tutorial video*
git checkout -b ep#
git push --set-upstream origin ep#
*make changes/commits*
    git push <each set of changes>
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
