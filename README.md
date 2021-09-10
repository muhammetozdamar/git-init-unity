# git-init-unity
Handy little shell script that initializes repository for Unity projects.

## Installation

1. Simply download git-init-unity.sh
2. Move it to `/usr/bin` (Ex. full path: `C:\Program Files\Git\usr\bin`)
3. Open Git Bash as an Administrator and give executable right with 
```console
chmod +x /usr/bin/git-init-unity.sh
```

## Usage
1. Create a repository for your project. (Without README.md and .gitignore), and copy HTTPS link of the remote repository.
(Ex. https://github.com/user/repo.git)
2. In root of your Unity project directory, run;
```console
git-init-unity.sh -r https://github.com/user/repo.git
```

You can modify README content with -p
```console
git-init-unity.sh -r https://github.com/user/repo.git -p "custom readme"
```
You can also modify commit message with -c
```console
git-init-unity.sh -r https://github.com/user/repo.git -p "custom readme" -c "first commit or whatever"
```



## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
