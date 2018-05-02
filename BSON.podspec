#
# Be sure to run `pod lib lint ClientCommon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BSON'
  s.version          = '6.0.0'
  s.summary          = 'Native Swift library for BSON (http://bsonspec.org).'

  s.description      = <<-DESC
[![Swift 3.1](https://img.shields.io/badge/swift-3.1-orange.svg)](https://swift.org)
![License](https://img.shields.io/github/license/openkitten/mongokitten.svg)
[![Build Status](https://api.travis-ci.org/OpenKitten/BSON.svg?branch=bson5)](https://travis-ci.org/OpenKitten/BSON)

BSON 5 is the fastest BSON library speeding past all libraries including C. It's compliant to the whole C BSON specification test suite, and even passes official libraries in compliance slightly.
 
It's not only fast, it's also got an extremely easy and intuitive API for extraction.

BSON is parsed and generated as specified for version 1.1 of the [BSON specification](http://bsonspec.org/spec.html).
                       DESC

  s.homepage         = 'https://github.com/Calthings/BSON'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joannis Orlandos' => 'joannis@orlandos.nl' }
  s.source           = { :git => 'git@github.com:Calthings/BSON.git', :branch => 'master/6.0' }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'

  s.source_files = 'Sources/**/*'

end