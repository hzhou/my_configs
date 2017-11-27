uname=`uname -s`
PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin

mkdir -p $HOME/{bin,lib,projects}

cp -v _bashrc $HOME/.bashrc
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

export PERL5LIB MYDEFLIB MYDEFSRC PATH

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

if [[ "$uname" =~ CYGWIN ]]; then
    mydef_run setup_cygwin.def
fi

echo "RUN . ~/.bashrc"
