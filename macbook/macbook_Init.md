# setup-mac.sh 작성과 주석
* #!/bin/bash -> 해당 스크립트는 bash 쉘로 실행시킨다는 의미

* 함수 생성법 = 함수명() { 함수코드 }  
    setup_pkg() { ... } 함수를 생성했고
    setup_pkg 라고 적어주어서 함수를 실행시켰다.

* setup_pkg() 함수 뜯어보기  
    * if문 brew가 없다면 brew를 설치해준다.
    * PACKAGES 변수에 brew에 담아줄 패키지들을 전부 적어준 다음 (컴마 없이 한줄씩 적어주었다.)
    * brew install ${PACKAGES[@]} 로 PACKAGES array의 모든 원소 설치
    * APPLICATIONS 변수에 사용할 어플리케이션 목록 담아준 다음 install --cask로 설치
    * 폰트 관리도 해준다. 원하는 폰트들 담아두면 전부 받아온다.
* 코드 질문...  
  1. [[ 를 사용한 이유는 몰?루.. 나중에 알아보기  

git 로그인  
* git-credential-osxkeychain 문제 해결방법  
    * `$ git credential-osxkeychain` → osxkeychain 헬퍼가 설치 돼 있는지 확인  
    * `$ git config —global credential.helper osxkeychain`  
    * **Keychain Access** → [github.com](http://github.com)이 내 계정이랑 일치하는지 확인하고 아니라면 내 계정을 github.com으로 설정하고 다른 계정은 삭제

파이썬 설치하기  

java 설치하기  
    * `$ brew tap AdoptOpenJDK/openjdk` → tap 해주기  
    * `$ brew search openjdk` → 많은 버전의 자바 보여준다. 내가 필요한 버전 설치하기  
    * `$ brew install adoptopenjdk8, 11, 14` → 8, 11, 14 설치


노드 설치하기  
    `$ sudo npm install -g n`
    n lts # lts 버전 설치

homebrew 받은 패키지 완전히 지우기  
brew cleanup tomcat@9 → brew에서 받은 파일 완전히 제거하는 방법

---




초기 세팅 설정법...
1. Homebrew 설치 - setup.sh로 해결  

2. Oh My Zsh 설치하기 - setup.sh로 해결  
   chsh -s $(which zsh) # zsh 설치경로를 찾아서 기본 쉘을 바꿔준다.  

3. .zshrc 설정
 * prerequisite
    1. zsh 플러그인 받기
    ```
    # zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    # zsh-autosuggestions
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    ```
    1. python 3 설치
    2. pyenv, pyenv-virtualenv 설치
    3. rbenv 설치
   
* `vi ~/.zshrc`에 넣어줄 내용  
    ```
    ZSH_THEME = "agnoster"

    plugins=(
        git
        zsh-syntax-highlighting
        zsh-autosuggestions
    )

    alias vim="nvim"
    alias vi="nvim"
    alias vimdiff="nvim -d"
    alias pip=/usr/local/bin/pip3
    alias python="python3"
    alias study="cd ~/study"
    alias project="cd ~/study/project/maple_info" # 지금 작업중인 프로젝트로 이동하게 만들어야겠음
    alias ps="cd ~/study/ps/python" # 지금 공부중인 problemsolving
    alias pywork="cd ~/study/WorkspacePython"
    alias c="clear"


    # exports
    export EDITOR=/usr/local/bin/nvim
    export PATH="$HOME/.pyenv/bin:$PATH"
    export PYENV_ROOT=/usr/local/var/pyenv
    if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    fi
    if which pyenv-virtualenv-init > /dev/null; then 
    eval "$(pyenv virtualenv-init -)"; 
    fi
    # rbenv PATH
    [[ -d ~/.rbenv  ]] && \
    export PATH=${HOME}/.rbenv/bin:${PATH} && \
    eval "$(rbenv init -)"
    ```

4. iTerm color scheme 설정해주기  

* gitconfig 파일
```
git config --global user.name "이름"
git config --global user.email "email@gmail.com"
git config --global core.autocrlf input // 맥에서는 input 윈도우에서는 true로 설정
git config --global alias.단축키 status(원 명령어) // git status를 git 단축키로 변경
```

```
[user]
	name = FrancisJeon
	email = jsw00827@gmail.com
[core]
	autocrlf = input
[credential]
  helper = osxkeychain
[alias]
  l = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit
  s = status -s
  co = checkout
  ci = commit
  br = branch
  ad = add *
  cm = commit -m
```

# vim 개발환경 설정하기

# VS Code 설정하기
지금은 github 로그인으로 싱크를 맞출 수 있다.
혹시라도 문제 발생시 해결법 작성할 예정

