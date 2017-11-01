<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Regional Maps</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" media="all" rel="stylesheet" />
    <link href="assets/site.css?version={{ version }}" media="all" rel="stylesheet" />
    <script src="assets/es6-promise.auto.min.js" type="application/javascript"></script>
    <script src="assets/fetch.js" type="application/javascript"></script>
    <script src="assets/site.js?version={{ version }}" type="application/javascript"></script>
</head>
<body>
    <nav class="navbar sticky-top navbar-light bg-light">
        <a class="navbar-brand" href="/">Topo Regions</a>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6">
                <d3form schema="config/countries.json"></d3form>
            </div>
            <div class="col-sm-6">
                <visual schema="config/regions.json"></visual>
            </div>
        </div>
    </div>
</body>
</html>
