++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Unit-based Selective Instrumentation (UBSI) for tc-in-a-box
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

The following steps are necessary to apply UBSI to a set of applications
on the trace vm on tc-in-a-box: 

1. Change the Vagrantfile for tc-in-a-box to ensure that the trace VM uses
the needed resources. 

# Allocate extra hardware resources for the trace VM.
trace.vm.provider "virtualbox" do |v|
   v.memory = 16384
   v.cpus = 2
end

2. Stop the tc-in-a-box VMs 

>> vagrant halt

3. Restart the tc-in-a-box VMs for these changes to take effect:

>> vagrant up

4. ssh into the trace VM:

>> vagrant ssh trace

5. Copy and unzip UBSI_patch.tar.gz on the trace VM in /home/vagrant. 

>> cd UBSI_patch
>> ./install.sh

This script will patch a set of applications in order to apply the TRACE 
unit-based selective instrumentation, which provides a finer causality 
granularity.

3. The directory /home/vagrant/TRACE/BIN will contain all the executables
with UBSI instrumentation. To leverage the instrumented applications when 
testing the TRACE framework, the path has to be set accordingly:

>> export PATH=/home/vagrant/TRACE/BIN:$PATH
