#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
declare -i data=5\*1024\*1024\*1024\/1024
./db_bench --benchmarks="fillrandom,stats,levelstats" \
--db=./test \
--db_paths_1=./test \
--db_paths_2=./test1 \
--threads=1 \
--wal_dir=./test \
--enable_write_thread_adaptive_yield=false \
--disable_auto_compactions=false \
--compression_type=snappy \
--max_background_jobs=36 \
--value_size=1024 --key_size=16 --enable_pipelined_write=true \
--allow_concurrent_memtable_write=true \
--batch_size=1 \
--use_direct_io_for_flush_and_compaction=true \
--target_file_size_base=67108864 \
--sync=false \
--num=${data}  \



