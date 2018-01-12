# need check make, vim, python3
if ! make -v >/dev/null; then
    echo make not installed!
    exit
fi

export PATH=$HOME/bin:$PATH
uname=`uname -a`
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

cd $curdir

if [[ "$uname" =~ Darwin ]]; then
    mydef_run setup_mac.def
fi
if [[ "$uname" =~ CYGWIN|Microsoft ]]; then
    mydef_run setup_windows.def
fi
if [[ "$HOME" =~ com.termux ]]; then
    mydef_run setup_android.def
fi

echo "RUN . ~/.bashrc"
