# Generate slurm debs

Build slurm debs using vagrant + virtualbox

Assuming the dependencies are installed in your system you only need to execute `vagrant up` to boot a Ubuntu VM, install the required dependencies and build the deb packages.

Once the build completes you should get a folder `slurm_23.11.5` with the deb packages.

The build log includes the date. It can be something like `slurm_23.11.5/slurm-23.11.5/slurm-23.11.5.build.2024-03-25T11h24+00h00.log`


