#
# Cookbook Name:: windows_openssl
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

if node[:platform_family] == 'windows'

    #Installing Dependencies
    include_recipe 'msys2'
    include_recipe 'mingw'

    #Creating OpenSSL Folder
    directory 'C:\openssl' do
    end

    #Creating Sub-folder for Source Code
    directory 'C:\openssl\src' do
    end

    #Downloading Source Code
    remote_file 'c:\openssl\src\openssl-1.0.2h.tar.gz' do
      source 'https://www.openssl.org/source/openssl-1.0.2h.tar.gz'
      action :create
    end

    #Unpacking Source Code
    execute 'unpack-gzip' do
      command '7z x openssl-1.0.2h.tar.gz'
      cwd 'c:\openssl\src'
      action :nothing
    end

    execute 'unpack-tar' do
      command '7z x openssl-1.0.2h.tar'
      cwd 'c:\openssl\src'
      action :nothing
    end

    #TODO: Something breaks during the make that I'm trying to work out.
    #TODO: I think it has something to do with the 64-bit build
    #TODO: Trying the 32-bit instead and then will
    #TODO: script the msys2 commands here

    #Add Path for msys2
    #export PATH="/c/msys2/mingw32/bin:$PATH"

    #Install Dependencies for msys2
    #pacman -S perl gcc make mingw-w64-i686-toolchain

    #Run Configure Script
    #./Configure --prefix=$PWD/dist no-idea no-mdc2 no-rc5 shared minigw

    #Run Make

    #Make and Install
    #make depend && make && make install

  else
    Chef::Log.warn "Platform '#{node['platform_family']}' not supported, nothing to do."
end
