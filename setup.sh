ln -s $HOME/projects/my_configs/_bashrc $HOME/.bashrc
ln -s $HOME/projects/my_configs/_vimrc  $HOME/.vimrc
ln -s $HOME/projects/my_configs/_vim  $HOME/.vim

cd $HOME/projects
git clone https://github.com/hzhou/MyDef
cd MyDef
sh bootstrap.sh

source $HOME/.bashrc

for a in output_c output_java output_python output_tcl output_glsl; do
    cd $HOME/projects
    git clone https://github.com/hzhou/$a
    cd $a
    mydef_make
    make
    make install
done

cd $HOME/projects
git clone https://github.com/hzhou/teach_2017
