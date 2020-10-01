function [] = drawGraph(A, r, n)

points_x = unifrnd(0,sqrt(A),[1 n]);
points_y = unifrnd(0,sqrt(A),[1 n]);

graph_source = [];
graph_destination = [];

for i=1:1:n
    x = [points_x(i) points_y(i)];
    for j=i+1:1:n
        y = [points_x(j) points_y(j)];
        distance = norm(x-y);
        if distance < r
            graph_source = [graph_source i]; 
            graph_destination = [graph_destination j];
        end
    end
end

G = graph(graph_source,graph_destination, graph_destination, n);
h = plot(G);
title(['number of nodes: ', num2str(n)])
xlabel(['area size = ', num2str(A)])
h.NodeColor = 'r';
h.MarkerSize = 4;
h.XData = points_x;
h.YData = points_y;
labelnode(h,[1:n],'')

end

