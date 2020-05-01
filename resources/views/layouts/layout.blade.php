<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="CybrSecure">
    <meta name="author" content="Mykel Agathos">    
    <title>@yield('title')</title>
    <link rel="shortcut icon" href="{{ asset('favicon.ico') }}" type="image/x-icon"/>
    <link rel="icon" href="{{ asset('favicon.ico') }}" type="image/x-icon"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,400,600,800" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet" type="text/css">
  </head>
  <body>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <!-- main -->
    <div class="main">
      <!-- title -->
      <div class="title m-b-md">
        @yield('main-header')
      </div>

      <!-- sub-title -->
      <div class="sub-title">
        @yield('sub-header')
      </div>

      <hr class="line">
      
      <!-- links -->
      <div class="links">
        @yield('links')
      </div>
      
      <hr class="line">
      
      <!-- main content -->
      <div class="main-section">
        @yield('main-section')
      </div>
      
      <!-- footer -->
      <div class="footer">
        Copyright © 2020
        <span class="dark-line">|</span>
        CybrSecure.Net
        <span class="dark-line">|</span>
        All Rights Reserved
        <br>
        <a href="">Terms of Service</a>
        <span class="dark-line">|</span>
        <a href="#privacy-modal" data-toggle="modal" data-target="#privacy-modal">Privacy Policy</a>
        <span class="dark-line">|</span>
        <a href="#contact-modal" data-toggle="modal" data-target="#contact-modal">Contact</a>
      </div>
    </div>
    @extends('modals.contact')
    @extends('modals.privacy')
  </body>
</html>
