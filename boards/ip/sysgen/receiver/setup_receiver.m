% Create message data
mbuf_data     = fi(double('Hi!'), 0, 8, 0);

% Get the message data length
length_mbuf_data = fi(numel(mbuf_data), 0, 8, 0);

% Append the message data length to the message
mbuf = [length_mbuf_data, mbuf_data];

% Prepare the barker code for frame synchronisation
barker_13 = fi([0 0 0 0 0 1 1 0 0 1 0 1 0], 0, 1, 0);
bbuf = reshape([barker_13; barker_13; barker_13], [1, length(barker_13)*3]);

% 8-bit Barker and zero padding
bbuf_padded = [zeros(1, 1) bbuf];
tx_data = zeros(1, numel(bbuf_padded)/8);
for i = 1:numel(bbuf_padded)/8
    tx_data(i) = bitconcat(bbuf_padded((i-1)*8 + 8),...
                           bbuf_padded((i-1)*8 + 7),...
                           bbuf_padded((i-1)*8 + 6),...
                           bbuf_padded((i-1)*8 + 5),...
                           bbuf_padded((i-1)*8 + 4),...
                           bbuf_padded((i-1)*8 + 3),...
                           bbuf_padded((i-1)*8 + 2),...
                           bbuf_padded((i-1)*8 + 1));
end

% Append the message data to the Barker code
tx_data = [tx_data mbuf];

% Prepare barker code for FIR
fir_barker_13 = fi([1 1 1 1 1 -1 -1 1 1 -1 1 -1 1], 1, 2, 0);
fir_bbuf = reshape([fir_barker_13; fir_barker_13; fir_barker_13], [1, length(fir_barker_13)*3]);