#!/usr/bin/python

def frange(start, stop, step):
    i = start
    while i < stop:
        yield i
        i += step

def mengyao_run_trials(experiment, generate_screenshots="false", log_prefix=""):

        # Note that this is 0 to 25 as range does [start, stop), thus we get 0:4:24 in Matlab speak
        # deform_range = range(0, 25, 4)
        # 5:5:25
        stretching_threshold_range = frange(0.65, 0.61, 0.05)
        trans_dir_deformability_range = [20, 30, 60, 200, 1000]
        trans_dis_deformability_range = [7, 10, 15, 20, 25]
        rotation_deformability_range = frange(5, 26, 5)

        # Run the single model baseline
        for trans_dir_deformability in trans_dir_deformability_range:
            for trans_dis_deformability in trans_dis_deformability_range:
                print trans_dis_deformability
                        
        # Note that this is 0 to 16 as range does [start, stop), thus we get 0:1:10 in Matlab speak

if __name__ == '__main__':
    mengyao_run_trials("cloth_wafr")        
