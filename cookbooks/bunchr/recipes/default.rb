#
# Cookbook Name:: bunchr
# Recipe:: default
#
# Copyright 2012, AJ Christensen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
package "curl"

directory "/opt/heavywater" do
  owner "vagrant"
  group "vagrant"
end

execute "bundle install --deployment --binstubs" do
  cwd "/vagrant"
  user "vagrant"
  group "vagrant"
  path %w{chef opscode}.map {|p| ::File.join("/opt", p, "embedded", "bin") }
end

execute "bundle exec rake" do
  cwd "/vagrant"
  user "vagrant"
  group "vagrant"
  path %w{chef opscode}.map {|p| ::File.join("/opt", p, "embedded", "bin") }
end
