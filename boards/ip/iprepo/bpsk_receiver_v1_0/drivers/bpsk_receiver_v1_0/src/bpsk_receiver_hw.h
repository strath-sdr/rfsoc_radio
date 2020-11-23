/**
*
* @file bpsk_receiver_hw.h
*
* This header file contains identifiers and driver functions (or
* macros) that can be used to access the device.  The user should refer to the
* hardware device specification for more details of the device operation.
*/ 
#define BPSK_RECEIVER_THRESHOLD 0xc/**< threshold */
#define BPSK_RECEIVER_RESET_TIME_SYNC 0x0/**< reset_time_sync */
#define BPSK_RECEIVER_RESET_PHASE_SYNC 0x4/**< reset_phase_sync */
#define BPSK_RECEIVER_RESET_FRAME_SYNC 0x8/**< reset_frame_sync */
#define BPSK_RECEIVER_OBSERVATION_POINT 0x24/**< observation_point */
#define BPSK_RECEIVER_ENABLE_TRANSFER 0x1c/**< enable_transfer */
#define BPSK_RECEIVER_COARSE_PASSTHROUGH 0x2c/**< coarse_passthrough */
#define BPSK_RECEIVER_DATA_COUNT 0x20/**< data_count */
#define BPSK_RECEIVER_FRAME_SIZE 0x10/**< frame_size */
#define BPSK_RECEIVER_FREQ_OFFSET 0x28/**< freq_offset */
#define BPSK_RECEIVER_PACKET_COUNT 0x18/**< packet_count */
#define BPSK_RECEIVER_PACKET_SIZE 0x14/**< packet_size */
