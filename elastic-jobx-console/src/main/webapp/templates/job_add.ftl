<#import "tags/dashboard.ftl" as dashboard>
<div>
    <h1>新增作业</h1>

    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="settings">
            <form id="job-add-form" class="form-horizontal">
                <div class="form-group">
	                <label for="jobName" class="col-sm-2 control-label">作业名</label>
	                <div class="col-sm-3">
                        <input type="text" id="jobName" name="jobName" class="form-control" data-toggle="tooltip" data-placement="bottom" title="作业名称" required />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="jobClass" class="col-sm-2 control-label">作业实现类</label>
                    <div class="col-sm-9">
                        <input type="text" id="jobClass" name="jobClass" class="form-control" data-toggle="tooltip" data-placement="bottom" title="作业实现类路径" required />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="shardingTotalCount" class="col-sm-2 control-label">作业分片总数</label>
                    <div class="col-sm-1">
                        <input type="number" id="shardingTotalCount" name="shardingTotalCount" class="form-control" data-toggle="tooltip" data-placement="bottom" title="作业分片数，需大于0" required />
                    </div>
                    
                    <label for="jobParameter" class="col-sm-2 control-label">自定义参数</label>
                    <div class="col-sm-2">
                        <input type="text" id="jobParameter" name="jobParameter" class="form-control" data-toggle="tooltip" data-placement="bottom" title="可以配置多个相同的作业，但是用不同的参数作为不同的调度实例" />
                    </div>
                    
                    <label for="cron" class="col-sm-2 control-label">cron表达式</label>
                    <div class="col-sm-2">
                        <input type="text" id="cron" name="cron" class="form-control" data-toggle="tooltip" data-placement="bottom" title="作业启动时间的cron表达式" required />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="concurrentDataProcessThreadCount" class="col-sm-2 control-label">处理数据的并发线程数</label>
                    <div class="col-sm-1">
                        <input type="number" id="concurrentDataProcessThreadCount" name="concurrentDataProcessThreadCount" class="form-control" data-toggle="tooltip" data-placement="bottom" title="只对高吞吐量处理数据流类型作业起作用" />
                    </div>
                    
                    <label for="processCountIntervalSeconds" class="col-sm-2 control-label">统计处理数据量的间隔秒数</label>
                    <div class="col-sm-2">
                        <input type="number" id="processCountIntervalSeconds" name="processCountIntervalSeconds" class="form-control" data-toggle="tooltip" data-placement="bottom" title="只对处理数据流类型作业起作用" />
                    </div>
                    
                    <label for="fetchDataCount" class="col-sm-2 control-label">每次抓取的数据量</label>
                    <div class="col-sm-2">
                        <input type="number" id="fetchDataCount" name="fetchDataCount" class="form-control" data-toggle="tooltip" data-placement="bottom" title="可在不重启作业的情况下灵活配置抓取数据量" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="maxTimeDiffSeconds" class="col-sm-2 control-label">最大容忍的本机与注册中心的时间误差秒数</label>
                    <div class="col-sm-1">
                        <input type="number" id="maxTimeDiffSeconds" name="maxTimeDiffSeconds" class="form-control" data-toggle="tooltip" data-placement="bottom" title="如果时间误差超过配置秒数则作业启动时将抛异常。配置为-1表示不检查时间误差。" />
                    </div>
                    
                    <label for="monitorPort" class="col-sm-2 control-label">监听作业端口</label>
                    <div class="col-sm-1">
                        <input type="number" id="monitorPort" name="monitorPort" class="form-control" data-toggle="tooltip" data-placement="bottom" title="抓取作业注册信息监听服务端口。配置为-1表示不启用监听服务。" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="monitorExecution" class="col-sm-2 control-label">监控作业执行时状态</label>
                    <div class="col-sm-2">
                        <input type="checkbox" id="monitorExecution" name="monitorExecution" data-toggle="tooltip" data-placement="bottom" title="每次作业执行时间和间隔时间均非常短的情况，建议不监控作业运行时状态以提升效率，因为是瞬时状态，所以无必要监控。请用户自行增加数据堆积监控。并且不能保证数据重复选取，应在作业中实现幂等性。也无法实现作业失效转移。每次作业执行时间和间隔时间均较长短的情况，建议监控作业运行时状态，可保证数据不会重复选取。" />
                    </div>
                    
                    <label for="failover" class="col-sm-2 control-label">支持自动失效转移</label>
                    <div class="col-sm-2">
                        <input type="checkbox" id="failover" name="failover" data-toggle="tooltip" data-placement="bottom" title="只有开启监控作业执行时状态的情况下才可以开启失效转移" />
                    </div>
                    
                    <label for="failover" class="col-sm-2 control-label">支持misfire</label>
                    <div class="col-sm-2">
                        <input type="checkbox" id="misfire" name="misfire" data-toggle="tooltip" data-placement="bottom" title="是否开启任务错过重新执行" />
                    </div>
                </div>
                
                <div class="form-group">
                	<label for="failover" class="col-sm-2 control-label">跳过执行期间</label>
                	<div class="col-sm-2">
	                    <div class='input-group date' id='datetimepicker1'>
			                <input type='text' id='skipStartTime' class="form-control" title="从这个时间点开始跳过执行" />
			                <span class="input-group-addon">
			                    <span class="glyphicon glyphicon-calendar"></span>
			                </span>
			            </div>
			        </div>
			        <label for="failover" class="col-sm-1 control-label">～</label>
					<div class="col-sm-2">
						<div class='input-group date' id='datetimepicker2'>
			                <input type='text' id='skipEndTime' class="form-control"  title="到这个时间点之前跳过执行" />
			                <span class="input-group-addon">
			                    <span class="glyphicon glyphicon-calendar"></span>
			                </span>
			            </div>
		            </div>
                </div>
                
                <div class="form-group">
                    <label for="shardingItemParameters" class="col-sm-2 control-label">分片序列号/参数对照表</label>
                    <div class="col-sm-9">
                        <textarea id="shardingItemParameters" name="shardingItemParameters" class="form-control" data-toggle="tooltip" data-placement="bottom" title="分片序列号和参数用等号分隔，多个键值对用逗号分隔，类似map。分片序列号从0开始，不可大于或等于作业分片总数。如：0=a,1=b,2=c"></textarea>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="jobShardingStrategyClass" class="col-sm-2 control-label">作业分片策略实现类全路径</label>
                    <div class="col-sm-9">
                        <input type="text" id="jobShardingStrategyClass" name="jobShardingStrategyClass" class="form-control" data-toggle="tooltip" data-placement="bottom" title="默认使用按照IP地址顺序分片策略，可参照文档定制化分片策略" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="description" class="col-sm-2 control-label">作业描述信息</label>
                    <div class="col-sm-9">
                        <textarea id="description" name="description" class="form-control"></textarea>
                    </div>
                </div>
                <button type="reset" class="btn btn-inverse">重置</button>
                <button type="submit" class="btn btn-primary">确定</button>
            </form>
        </div>
    </div>
</div>
<@dashboard.successDialog "success-dialog" />
<@dashboard.failureDialog "add-job-failure-dialog" "新增任务失败，任务已存在" />
<@dashboard.failureDialog "time-equal-failure-dialog" "[跳过执行期间]的起止时间段不能相同" />
<@dashboard.failureDialog "connect-reg-center-failure-dialog" "连接失败，请检查注册中心配置" />
<script src="lib/jquery/jquery-2.1.4.min.js"></script>
<script src="lib/bootstrap/js/moment.min.js"></script>
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
<script src="lib/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="js/common.js"></script>
<script src="js/dashboard.js"></script>
<script src="js/job_add.js"></script>
