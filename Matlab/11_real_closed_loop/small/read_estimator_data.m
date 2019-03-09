ncid1 = netcdf.open('closedloop_kalmanData.nc');
time = netcdf.getVar(ncid1,0);
motor_speedEst = netcdf.getVar(ncid1,1);
alphaEst = netcdf.getVar(ncid1,2)+0.005;
betaEst = netcdf.getVar(ncid1,3);
car_accEst = netcdf.getVar(ncid1,4);
alpha_speedEst = netcdf.getVar(ncid1,5);
beta_speedEst = netcdf.getVar(ncid1,6);
motor_speed_spEst = netcdf.getVar(ncid1,7);
carousel_speed = netcdf.getVar(ncid1,8);
elevation = netcdf.getVar(ncid1,9)+0.005;
azimuth = netcdf.getVar(ncid1,10);

t=0:0.1:time(end);
t=t';
motor_speedEst=interp1(time,motor_speedEst,t,'spline');
alphaEst=interp1(time,alphaEst,t,'spline');
betaEst=interp1(time,betaEst,t,'spline');
car_accEst=interp1(time,car_accEst,t,'spline');
alpha_speedEst=interp1(time,alpha_speedEst,t,'spline');
beta_speedEst=interp1(time,beta_speedEst,t,'spline');
motor_speed_spEst=interp1(time,motor_speed_spEst,t,'spline');
carousel_speed=interp1(time,carousel_speed,t,'spline');
elevation=interp1(time,elevation,t,'spline');
azimuth=interp1(time,azimuth,t,'spline');
%Extracting control from nc file
ncid2 = netcdf.open('closedloop_lqrData.nc');
time_controller = netcdf.getVar(ncid2,0);
u = netcdf.getVar(ncid2,15);
u=interp1(time_controller,u,t,'spline');



