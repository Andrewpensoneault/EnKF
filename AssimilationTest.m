%% SIMPLIFIED MODEL FOR DATA ASSIMILATION
% Based on "An asynchronous solver for systems of ODEs linked by a directed
% tree structure" by Small et al.
% Implementation by:
% Andrew Pensoneault (University of Iowa - andrew-pensoneault@uiowa.edu)
clc
clear all
close all
rng('default')
format long g
paramstoy                                                                  %Loads Toy Parameters
%% ASSIMILATION
tic;
%% EnKF (Standard)
%%%%%%LOADS PARAMETERS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EnKFScriptParameters                                                       %Loads Parameters for Assimilation
%%%%%%PERFORMS ENKF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[vamean,Truth]=EnKF(Data,Truth,vp,Tmax,vpmean,vamean,H,N,Datdim,Statedim,...
    Sigma,Gamma,odefun,LSize);                                             %Performs EnKF
%%%%%%Generates PLOTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PlotCreate                                                                 %Plot Create
toc;
%% SREnKF
%When EnKF is Done
%% LeTKF
%%When SREnKF is Done
