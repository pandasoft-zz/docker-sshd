# docker-sshd
Dockerized SSHd server for testing or develop.

Not use for PROD environment!

Support:
 * Password Authentication
 * Key-Based Authentication

## Env

  * SSH_PORT - port number. Default 22
  * USER_PASS - password for user (Default user root)
  * PUBLIC_KEY - public key in openssl format

## Examples

Start with only password
 
 ```bash
 docker run --rm -p 22:22  -e USER_PASS=test1234  docker-sshd:latest
 ```

Start with public key 


file .test.env
```bash
echo "
USER_PASS=test1234
PUBLIC_KEY=ssh-rsa AAAAB3 ... yF0Q== test-key
" > .test.env
```

```bash
docker run --rm -p 22:22  --env-file .test-ssh.env.sh docker-sshd:latest
```



