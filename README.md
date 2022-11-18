# Dockerfiles for [php-laravel](https://hub.docker.com/repository/docker/sensasidelight/php-laravel) image

PHP Versions:

- [x] 7.4-fpm
- [x] 7.4-fpm-alpine
- [x] 8.0-fpm
- [x] 8.0-fpm-alpine
- [x] 8.1-fpm
- [x] 8.1-fpm-alpine

## Build for yourself

To build the image, you can run the command below on your command line.

```bash
docker build -f "[version tag].dockerfile" -t "sensasidelight/php-laravel:[version tag]" .
```

example:

```bash
docker build -f "7.4-fpm-alpine.dockerfile" -t "sensasidelight/php-laravel:7.4-fpm-alpine" .
```

after build process has finished, you can check the image by `docker images -a` command. Image `sensasidelight/php-laravel:7.4-fpm-alpine` should be on the list.

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!

1. Fork the Project.
2. Create your Feature Branch (`git checkout -b AmazingFeature`).
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the Branch (`git push origin AmazingFeature`).
5. Open a Pull Request.

## License

The code is released under the MIT license.

## Contact

Email - [zainadam.id@gmail.com](mailto:zainadam.id+gh+readme@gmail.com?subject=[GitHub]%20Dockerfiles%20for%20php-laravel)