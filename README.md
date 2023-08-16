# 52°North Server Landingpage Image

This image provides a bootstrap 5 based tiled landingpage for demo servers.

To use it, just mount your own `index.html` over the existing one in `/usr/share/nginx/html/index.html`.

## k8s

```yaml
apiVersion: v1
kind: Service
metadata:
  name: landingpage
  labels:
    app: landingpage
spec:
  selector:
    app: landingpage
  ports:
  - name: "http"
    port: 80
    targetPort: 80
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: landingpage
  labels:
    app: landingpage
spec:
  replicas: 1
  selector:
    matchLabels:
      app: landingpage
  template:
    metadata:
      labels:
        app: landingpage
    spec:
      containers:
      - name: landingpage
        image: 52north/server-landingpage:latest
        imagePullPolicy: Always
        resources:
          requests:
            memory: "16M"
            cpu: "1m"
          limits:
            memory: "256M"
            cpu: "500m"
        ports:
        - containerPort: 80
        volumeMounts:
        - name: landingpage-html-content
          mountPath: /usr/share/nginx/html/index.html
          subPath: index.html
      restartPolicy: Always
      volumes:
      - name: landingpage-html-content
        configMap:
          name: landingpage-html-content
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: landingpage-html-content
data:
  index.html: |
    <!DOCTYPE html>
    <html lang="de">
        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <!-- Bootstrap CSS -->
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="./css/bootstrap.min.css" />
            <link rel="stylesheet" href="./css/bootstrap-icons.min.css" />
            <link rel="stylesheet" href="./css/piss.css" />
            <!-- Latest compiled and minified JavaScript -->
            <script src="./js/bootstrap.min.js"></script>
            <link rel="icon" href="https://52north.org/wp-content/themes/52north/images/favicon-package/favicon.ico" />
            <title>52°North Server Landing Page Demo</title>
        </head>
        <body>
        <div id="content">
            <div class="row">
                <h1>52°North Server Landing Page Demo</h1>
            </div>
            <div id="landing-page-buttons" class="container">
                <div class="row">
                    <a class="col-lg-6 col-md-6 col-sm-6 col-xs-12" href="./redirect.html">
                        <div class="landing-page-button">
                            <div class="icon">
                                <span class="bi bi-bar-chart-line"></span>
                            </div>
                            <div class="caption">
                                service 1-1<sup>timeseries</sup>
                            </div>
                        </div>
                    </a>
                    <a class="col-lg-6 col-md-6 col-sm-6 col-xs-12" href="./redirect.html">
                        <div class="landing-page-button">
                            <div class="icon">
                                <span class="bi bi-geo"></span>
                            </div>
                            <div class="caption">
                                service 1-2<sup>trajectories</sup>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="row">
                    <a class="col-lg-4 col-md-4 col-sm-6 col-xs-12"
                        href="./redirect.html">
                        <div class="landing-page-button">
                            <div class="icon">
                                <span class="bi bi-hdd-network"></span>
                            </div>
                            <div class="caption">
                                Service <sup>2-1</sup>
                            </div>
                        </div>
                    </a> <a class="col-lg-4 col-md-4 col-sm-6 col-xs-12"
                        href="./redirect.html">
                        <div class="landing-page-button">
                            <div class="icon">
                                <span class="bi bi-download"></span>
                            </div>
                            <div class="caption">
                                Service <sup>2-2</sup>
                            </div>
                        </div>
                    </a> <a class="col-lg-4 col-md-4 col-sm-6 col-xs-12"
                        href="./redirect.html">
                        <div class="landing-page-button">
                            <div class="icon">
                                <span class="bi bi-cloud-download"></span>
                            </div>
                            <div class="caption">
                                Service <sup>2-3</sup>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h2>Another Section With Additional Services</h2>
                    </div>
                </div>
                <div class="row">
                    <a class="col-lg-4 col-md-4 col-sm-6 col-xs-12"
                        href="./redirect.html">
                        <div class="landing-page-button">
                            <div class="icon">
                                <span class="bi bi-hdd"></span>
                            </div>
                            <div class="caption">
                                Service<sup>3-1</sup>
                            </div>
                        </div>
                    </a> <a class="col-lg-4 col-md-4 col-sm-6 col-xs-12"
                        href="./redirect.html">
                        <div class="landing-page-button">
                            <div class="icon">
                                <span class="bi bi-tools"></span>
                            </div>
                            <div class="caption">
                                Service <sup>3-2</sup>
                            </div>
                        </div>
                    </a> <a class="col-lg-4 col-md-4 col-sm-6 col-xs-12"
                        href="./redirect.html">
                        <div class="landing-page-button">
                            <div class="icon">
                                <span class="bi bi-gear-wide-connected"></span>
                            </div>
                            <div class="caption">
                                Service <sup>3-3</sup>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="row">
                    <a class="col-lg-12 col-md-12 col-sm-12 col-xs-12" href="./redirect.html">
                        <div class="landing-page-button">
                            <div class="icon">
                                <span class="bi bi-gear"></span>
                            </div>
                            <div class="caption">
                                Service <sup>4</sup>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <footer>
                <div>
                    &lt;
                    Last update: 2023-08-16 |
                    &copy; 2023 copyright: <a href="https://52north.org/">52°North Spatial Information Reasearch GmbH</a> |
                    <a href="https://52north.org/about-us/contact-us/">contact</a> |
                    <a href="https://52north.org/about-us/contact-us/legal-notice/">legal notice</a>
                    &gt;
                </div>
            </footer>
        </div>
    </body>
    </html>
```

## docker-compose

```yaml
[...]
services:
[...]
  landingpage:
    image: 52north/server-landingpage:latest
    ports:
      - "80:80"
    volumes:
      - "/home/user/project/server/landingpage.html:/usr/share/nginx/html/index.html:r"
    [...]
```
