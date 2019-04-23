# Check if redis is installed
describe package('redis-server') do
  it { should be_installed }
end

# Check if redis service is running and enabled
describe service('redis-server') do
  it { should be_running }
  it { should be_enabled }
end

# Check if vim is installed
describe package('vim') do
  it { should be_installed }
end

# Check redis connection 
describe bash('redis-cli ping') do
  its('stdout') { should match 'PONG' }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end

# Check if redis listen on all IPs
describe bash('sudo netstat -apn | grep redis') do
  its('stdout') { should match '0.0.0.0:6379' }
end
