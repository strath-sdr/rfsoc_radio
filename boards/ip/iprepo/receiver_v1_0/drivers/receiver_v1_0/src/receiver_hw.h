/**
*
* @file receiver_hw.h
*
* This header file contains identifiers and driver functions (or
* macros) that can be used to access the device.  The user should refer to the
* hardware device specification for more details of the device operation.
*/ 
#define RECEIVER_THRESHOLD 0xc/**< threshold */
#define RECEIVER_RESET_TIME_SYNC 0x0/**< reset_time_sync */
#define RECEIVER_RESET_PHASE_SYNC 0x4/**< reset_phase_sync */
#define RECEIVER_RESET_FRAME_SYNC 0x8/**< reset_frame_sync */
#define RECEIVER_OBSERVATION_POINT 0x24/**< observation_point */
#define RECEIVER_MODULATION 0x30/**< modulation */
#define RECEIVER_GLOBAL_RESET_SYNC 0x38/**< global_reset_sync */
#define RECEIVER_ENABLE_TRANSFER 0x1c/**< enable_transfer */
#define RECEIVER_COARSE_PASSTHROUGH 0x2c/**< coarse_passthrough */
#define RECEIVER_BPSK_PACKET_COUNT 0x34/**< bpsk_packet_count */
#define RECEIVER_DATA_COUNT 0x20/**< data_count */
#define RECEIVER_FRAME_SIZE 0x10/**< frame_size */
#define RECEIVER_FREQ_OFFSET 0x28/**< freq_offset */
#define RECEIVER_PACKET_SIZE 0x14/**< packet_size */
#define RECEIVER_QPSK_PACKET_COUNT 0x18/**< qpsk_packet_count */
