ln -s $HOME/projects/my_configs/_bashrc $HOME/.bashrc
ln -s $HOME/projects/my_configs/_vimrc  $HOME/.vimrc
ln -s $HOME/projects/my_configs/_vim  $HOME/.vim

# source ~/.bashrc

cd $HOME/projects
git clone https://github.com/hzhou/MyDef
cd MyDef
sh bootstrap.sh

for a in output_c output_java output_python output_tcl; do
    cd $HOME/projects
    git clone https://github.com/hzhou/$a
    cd $a
    mydef_make
    make
    make install
done

cd $HOME/projects
git clone https://github.com/hzhou/teach_2017
