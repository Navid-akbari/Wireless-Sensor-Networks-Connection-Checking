function [] = secondBiggestSubgraph(A, r)

mean_second_subgraph_size = [];

ITERATION = 50;
NUMBER_OF_NODES = 500;

for n = 10:10:NUMBER_OF_NODES
    temp = 0;
    for k = 1:1:ITERATION
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
        bins = conncomp(G);

        y = zeros(size(bins));
        for j = 1:length(bins)
            y(j) = sum(bins==bins(j));
        end

        new_element = max(y(y<max(y)));
    
        if size(new_element,2) == 0
            temp = temp + 0;
        else
            temp = temp +  new_element;
        end
    end
    
    mean_second_subgraph_size = [mean_second_subgraph_size (temp/ITERATION)];
    
end

n = 10:10:NUMBER_OF_NODES;
plot(n, mean_second_subgraph_size)
title('Mean Size of Second Biggest Subgraph')
xlabel('Number of Nodes')
ylabel('Graph Size')

end

