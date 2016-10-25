using OpenCL
cl = OpenCL
function cl_platforms()
  for pf in cl.platforms()
    @printf "\n%s\n\n" pf
    @printf "Platform name:\t\t%s\n"  pf[:name]
    if pf[:name] == "Portable Computing Language"
      warn("PCL platform is not yet supported")
      continue
    else
      @printf "Platform profile\t\t:%s\n"  pf[:profile]
      @printf "Platform vendor:\t\t%s\n"  pf[:vendor]
      @printf "Platform version:\t\t%s\n\n" pf[:version]

      for dv in cl.available_devices(pf)
        @printf "Device name:\t\t%s\n" dv[:name]
        @printf "Device type:\t\t%s\n" dv[:device_type]
        gms = dv[:global_mem_size] / (1024*1024)
        @printf "Device memory:\t%i MB\n"  gms
        mma = dv[:max_mem_alloc_size] / (1024*1024)
        @printf "Device max memory alloc:\t%i MB\n" mma
        mcu = device[:max_compute_units]
        @printf "Device max compute units:\t%i\n"  mcu
        mwgs = device[:max_work_group_size]
        @printf "Device max work group size:\t%i\n"mwgs
        mwis = device[:max_work_item_size] 
        @printf "Device max work item size:\t%s\n"  mwis
      end
    end
  end
end
