export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin
uname=`uname -s`
curdir=`pwd`

mkdir -p $HOME/bin
mkdir -p $HOME/lib
mkdir -p $HOME/projects

cp -fv _bashrc $HOME/.bashrc
cp -v _vimrc  $HOME/.vimrc
cp -rv _vim $HOME/.vim
echo source .bashrc >$HOME/.bash_profile

cd $HOME/projects
if [ -d MyDef ]; then
    cd MyDef
    git pull
else
    git clone https://github.com/hzhou/MyDef
    cd MyDef
fi
sh bootstrap.sh

PERL5LIB=$HOME/lib/perl5
MYDEFLIB=$HOME/lib/MyDef
MYDEFSRC=$HOME/projects/MyDef

export PERL5LIB MYDEFLIB MYDEFSRC

for a in output_c output_java output_python ; do
    cd $HOME/projects
    if [ -d $a ]; then
        cd $a
        git pull
    else
        git clone https://github.com/hzhou/$a
        cd $a
    fi
    mydef_make
    make
    make install
done

cd $HOME/projects
if [ -d teach_2017 ]; then
    cd teach_2017
    git pull
else
    git clone https://github.com/hzhou/teach_2017
fi

if [[ "$uname" =~ Darwin ]]; then
    echo 'alias ls="ls -G"' >>$HOME/.bashrc
else
    echo 'alias ls="ls --color=auto"' >>$HOME/.bashrc
fi
if [[ "$uname" =~ CYGWIN ]]; then
    cd $curdir
    mydef_run setup_cygwin.def
fi

echo "RUN . ~/.bashrc"
