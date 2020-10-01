function [] = percolation(A, n)

probabilities = [];

ITERATION = 100;
BIGGEST_RADIUS = 5;

for r = 0.1:0.1:BIGGEST_RADIUS
    number_of_occurances = 0;

    for k=1:1:ITERATION
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
        for i = 1:length(bins)
            y(i) = sum(bins==bins(i));
        end
        
        
        if max(y) == n
            number_of_occurances = number_of_occurances + 1;
        end
    end
    
    probabilities = [probabilities number_of_occurances/ITERATION];

end

r = 0.1:0.1:BIGGEST_RADIUS;
plot(r, probabilities)
title('Percolation')
xlabel('Range of Nodes')
ylabel('Probability of Percolation')

end

