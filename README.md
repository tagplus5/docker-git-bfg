[bfg-repo-cleaner manual](https://rtyley.github.io/bfg-repo-cleaner)

#### Usage

```
git clone --mirror git://example.com/some-big-repo.git
```
This is a bare repo, which means your normal files won't be visible, but it is a full copy of the Git database of your repository, and at this point you should make a backup of it to ensure you don't lose anything.

Now you can run the BFG to clean your repository up:

Delete all files named 'id_rsa' or 'id_dsa' :
```
docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files id_{dsa,rsa} some-big-repo.git
```
```
docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --strip-blobs-bigger-than 100M some-big-repo.git
```
The BFG will update your commits and all branches and tags so they are clean, but it doesn't physically delete the unwanted stuff. Examine the repo to make sure your history has been updated, and then use the standard git gc command to strip out the unwanted dirty data, which Git will now recognise as surplus to requirements:
```
cd some-big-repo.git
```
```
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```
Finally, once you're happy with the updated state of your repo, push it back up (note that because your clone command used the --mirror flag, this push will update all refs on your remote server):
```
git push
```
