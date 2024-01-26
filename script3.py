# build_number_replace.py
def replace_build_number(yaml_file, build_file):
    with open(build_file, 'r') as file:
        build_number = file.read().strip()

    with open(yaml_file, 'r') as file:
        content = file.read()

    new_content = content.replace('%BUILD_NUMBER%', build_number)

    with open(yaml_file, 'w') as file:
        file.write(new_content)

if __name__ == "__main__":
    replace_build_number('my-kubernetes-deployment.yaml', 'build.txt')
