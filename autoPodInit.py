import sys,os,time

filename = 'Podfile'
strfile = "platform :ios, ‘8.0’ \n\
target 'project_name' do \n\
pod'JLeeTools','~> 0.2.3' \n\
end"

def write(path=''):
    # print ('路径',path)
    if not os.path.isdir(path):
        print (path,' 不是文件夹')
        exit(1)

    names = os.listdir(path)
    proj = ''
    for x in names:
        if x.endswith('.xcodeproj'):
            x = x.replace('.xcodeproj','')
            proj = x

    content = strfile.replace('project_name',proj)
    file_object = open(path+'/'+filename, 'w')
    file_object.writelines(content)
    file_object.close()

    print ('writed success')
    # time.sleep(1)
    init(path)
def init(pod_path):
    print ('pod_path:',pod_path)
    os.system('cd '+pod_path +'\n'+ 'pod install')

    print ('pod install success')


if __name__ == '__main__':
    if len(sys.argv) == 2:
        write(sys.argv[1])
    else:
        print('非法参数')
    exit(1)



