/*
 * Copyright 1999-2015 dangdang.com.
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * </p>
 */

package com.dangdang.ddframe.job.internal.config.global;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.recipes.cache.TreeCacheEvent;
import org.apache.curator.framework.recipes.cache.TreeCacheEvent.Type;

import com.dangdang.ddframe.job.internal.listener.global.AbstractGlobalListener;
import com.dangdang.ddframe.job.internal.listener.global.AbstractGlobalListenerManager;
import com.dangdang.ddframe.job.internal.sharding.strategy.JobShardingStrategyCache;
import com.dangdang.ddframe.job.internal.storage.global.GlobalNodePath;
import com.dangdang.ddframe.reg.base.CoordinatorRegistryCenter;

/**
 * 全局配置监听管理器.
 * 
 * @author xiong.j
 */
public class GlobalConfigListenerManager extends AbstractGlobalListenerManager {
	public final GlobalConfigurationService globalConfigurationService;
	
    public GlobalConfigListenerManager(final CoordinatorRegistryCenter coordinatorRegistryCenter) {
        super(coordinatorRegistryCenter);
        globalConfigurationService = GlobalConfigurationService.getInstance(coordinatorRegistryCenter);
    }
    
    @Override
    public void start() {
        addDataListener(new GlobalStrategyChangedJobListener());
    }
    
    class GlobalStrategyChangedJobListener extends AbstractGlobalListener {
        
        @Override
        protected void dataChanged(final CuratorFramework client, final TreeCacheEvent event, final String path) {
        	// 全局分片策略监听
            if (GlobalNodePath.isShardingStrategyPath(path)) {
                if (Type.NODE_UPDATED == event.getType()) {
                	JobShardingStrategyCache.reLoadGlobalStrategy(globalConfigurationService, getStrategyPath(path));
                }
                if (Type.NODE_REMOVED == event.getType()) {
                	JobShardingStrategyCache.removeStrategy(getStrategyPath(path));
                }
            }

        }
        
        private String getStrategyPath(String path) {
        	return path.substring(path.lastIndexOf("/") + 1);
        }
    }
}
