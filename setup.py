import os
# print (os.getcwd())#获得当前工作目录
env =os.environ['HOME']
bashrc_path =env + '/.bashrc'
bash_pofile_path = env + '/.bash_profile'

setup_command = "alias autopod='python3 %s/autoPodInit.py'" % os.getcwd()
source_command = 'source ~/.bashrc'

# if os.path.exists(bashrc_path):#存在的话只改写

def writecommand(filepath,command):

    old_str = ''
    if os.path.exists(filepath):#存在的话只改写
        f = open(filepath, "r") 
        # lastpos = len(f) - 1
        lines = f.readlines() #读取所有行
        # print(lines)
        if len(lines) ==0:
            old_str = command
        else:
            for i,content in enumerate(lines):
                if command in content:
                    # print('有了')
                    old_str = lines
                    break
                elif i == len(lines)-1:
                    content = content + '\n' + command
                old_str += content
        # print ('old:',old_str)
    else:
        # print ('空的')
        old_str = command

    file_object = open(filepath, 'w')
    file_object.writelines(old_str)
    file_object.close()

    print (filepath,old_str,'writed success')

if __name__ == '__main__':
    writecommand(bashrc_path,setup_command)
    writecommand(bash_pofile_path,source_command)


# print (command)
# 终端命令：python3 os.getcwd()+'/'+'autoPodInit.py'

# 有时候我们需要记住一长串的终端命令：
# 现在又一个简单的办法
# 第一步：
# 解决办法是编辑~/.bashrc文件，每行加入一个alias命令。比如：
# alias pupdate='pod update --verbose --no-repo-update'

# 第二步 执行vim ~/.bash_profile 然后输入(该文件是每次打开终端都会自动执行的文件) 
# source ~/.bashrc
# 就完成了；

# Mac终端查看当前路径
# pwd