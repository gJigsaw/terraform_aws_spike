tl;dr
============
```shell
export AWS_ACCESS_KEY_ID=<YourID>
export AWS_SECRET_ACCESS_KEY=<YourSecret>
```
```shell
export BASE_DIR=<directory_of_this_README>
```
`source $BASE_DIR/images/docker/now/now.sh`
```shell
cd $BASE_DIR/images/packer/
now packer build docker.json
```
```shell
cd $BASE_DIR/infrastructure
now terraform get
now terraform apply
```
- wait
- browse
- smile
```shell
now terraform destroy
```

Requirements
============

#### [Docker](http://www.docker.com) (installed and running)
- Suggested Version: 1.11.0, build 4dc5990
- Test: `docker run --rm -v $(pwd):/foo busybox ls /foo`
- Expected Result: A listing of your local directory

#### [Amazon AWS credentials](https://console.aws.amazon.com/iam/home#security_credential)
```shell
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
```
- Your account will need rights to the `us-east-1` region

#### Internet Access
- Always
    - Infrastructure from [Amazon AWS](https://aws.amazon.com)
    - Docker images from [Docker Hub](https://hub.docker.com)
- Only if you build docker images locally
    - Terraform and Packer from [Hashicorp](https://releases.hashicorp.com/)
    - WAR and ZIP files from [Amazon S3](https://aws.amazon.com/s3/)
(via [MandrillApp](https://mandrillapp.com/))

Conveniences
============

- Tools should require as few depencies, keystrokes, and remembered subcommands as possible.
- To that end, please `source ./images/docker/now/now.sh` to get a handy function.
- Now, you don't need to install terraform, packer, or anything else!

Images
======
#### Flask and Proxy Docker Images
- Pre-Built and accessible anonymously via `hub.docker.com`
- Dockerfiles and contexts accessible anonymously on github - gjigsaw/docker

#### EC2 Amazon AMI
- Build required.
```shell
cd ./images/packer/
```
```shell
now packer build docker.json
```
- Copy that AMI; you'll need it in just a moment.

Infrastructure
==============

### Create both training and (limited release) production environments
```shell
cd infrastructure
```
```shell
now terraform get
```
```shell
now terraform apply
```
- Enter the AMI from above.

##### Patience Please
- It will likely take 2-4 minutes to finish and report your URLs.
- Even after returning, those URLS will _not_ respond immediately.
  - It will likely take 3-5 _more_ minutes for everything to come online.
- Rather than continuing to click refresh, please consider:

    ```shell
    export URL=$(now terraform output production_dns | tr '\r' ' ')
    ```

    ```shell
    until $(curl -sfI -o /dev/null http://$URL); do printf '.'; sleep 15; done; echo Ready!
    ```

### Remove both environments
```shell
cd infrastructure
now terraform destroy
```

Local Development
=================
If you wish, you can test the two docker images locally.
```shell
docker run --detach --name app gjigsaw/cn-app:20160417-1900
```
```shell
docker run --detach --link app --name web --publish 80:80 \
 --volume <absolute_path_to>/images/docker/web/default_nginx.conf:/etc/nginx/conf.d/default.conf \
gjigsaw/cn-web:20160417-1900
```
