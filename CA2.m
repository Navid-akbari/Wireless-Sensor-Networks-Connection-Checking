clc;
clear;

%% part one section one
figure(1)
drawGraph(100, 1, 10)

figure(2)
drawGraph(100, 1, 50)

figure(3)
drawGraph(100, 1, 100)

figure(4)
drawGraph(100, 1, 300)

figure(5)
drawGraph(100, 1, 1000)

%% part one section two
biggestSubgraph(100, 1)

%% part one section three
secondBiggestSubgraph(100, 1)

%% part one section four
aloneNodes(100, 1)

%% part two section one
alphaConnected(100, 100, 0.8)
 
%% part two section two
alphaConnected(100, 100, 0.5)

%% part two section three
alphaConnected(1000, 1000, 0.8)

%% part two section four
percolation(100, 100)