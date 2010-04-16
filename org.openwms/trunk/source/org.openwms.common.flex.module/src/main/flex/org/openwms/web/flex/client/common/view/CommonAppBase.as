/*
 * openwms.org, the Open Warehouse Management System.
 *
 * This file is part of openwms.org.
 *
 * openwms.org is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * openwms.org is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software. If not, write to the Free
 * Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA, or see the FSF site: http://www.fsf.org.
 */
package org.openwms.web.flex.client.common.view
{
	import mx.collections.ArrayCollection;
	import mx.collections.XMLListCollection;
	import mx.controls.MenuBar;
	
	import org.openwms.web.flex.client.HashMap;
	import org.openwms.web.flex.client.IApplicationModule;
	import org.openwms.web.flex.client.MenuItemMap;
	import org.openwms.web.flex.client.common.command.LoadLocationGroupsCommand;
	import org.openwms.web.flex.client.common.command.LoadLocationsCommand;
	import org.openwms.web.flex.client.common.command.ShowLocationGroupCommand;
	import org.openwms.web.flex.client.common.command.ShowLocationViewCommand;
	import org.openwms.web.flex.client.common.command.ShowTransportUnitCommand;
	import org.openwms.web.flex.client.common.event.LoadLocationGroupsEvent;
	import org.openwms.web.flex.client.common.event.LocationEvent;
	import org.openwms.web.flex.client.control.MainController;
	import org.openwms.web.flex.client.event.SwitchScreenEvent;
	import org.openwms.web.flex.client.model.ModelLocator;
	import org.openwms.web.flex.client.module.CommonModule;

    public class CommonAppBase extends CommonModule implements IApplicationModule
    {
        
        [Bindable]
		public var menuCollection:ArrayCollection;
		[Bindable]
		public var menuBarItemsCollection:XMLListCollection;
		[Bindable]
		private var modelLocator:ModelLocator = ModelLocator.getInstance();
        [Bindable]
        public var commonMenuBar:MenuBar;
        [Bindable]
        private var mainController:MainController = MainController.getInstance();
        
        /**
         * Constructor.
         */ 
        public function CommonAppBase()
        {
        	super();
        }		
        
		protected override function initApp():void
		{
		    trace("InitApp in common module called");
		}

		/**
		 * This method returns a list of menu items which shall be expaned to the main
		 * application menu bar.
		 */
		public function getMainMenuItems():HashMap
		{
			bindCommands();
		    var map:MenuItemMap = new MenuItemMap(commonMenuBar.dataProvider as XMLListCollection);
		    return map;
		}

		/**
		 * This method returns the name of the module as unique String identifier.
		 */
		public function getModuleName():String
		{
		    return "COMMON";
		}
		
		/**
		 * This method returns a list of items which shall be expaned to the context popup
		 * menu. The list contains objects with key,value pairs. The key is the name of the
		 * gui component where the popup shall appear, the value is the list of popup items.
		 */
		public function getPopupItems():ArrayCollection
		{
		    return new ArrayCollection();
		}
		
		public function getViews():ArrayCollection
		{
		    return new ArrayCollection();
		}
		
        public function initializeModule():void
        {
        	
        }

        public function destroyModule():void
        {
        	mainController.unregisterHandler(SwitchScreenEvent.SHOW_LOCATION_VIEW);
            mainController.unregisterHandler(SwitchScreenEvent.SHOW_LOCATIONGROUP_VIEW);
            mainController.unregisterHandler(SwitchScreenEvent.SHOW_TRANSPORTUNIT_VIEW);
            mainController.unregisterHandler(LoadLocationGroupsEvent.LOAD_ALL_LOCATION_GROUPS);
            mainController.unregisterHandler(LocationEvent.LOAD_ALL_LOCATIONS);
        }

        private function bindCommands():void
        {
            mainController.registerHander(SwitchScreenEvent.SHOW_LOCATION_VIEW, ShowLocationViewCommand);
            mainController.registerHander(SwitchScreenEvent.SHOW_LOCATIONGROUP_VIEW, ShowLocationGroupCommand);
            mainController.registerHander(SwitchScreenEvent.SHOW_TRANSPORTUNIT_VIEW, ShowTransportUnitCommand);
            mainController.registerHander(LoadLocationGroupsEvent.LOAD_ALL_LOCATION_GROUPS, LoadLocationGroupsCommand);
            mainController.registerHander(LocationEvent.LOAD_ALL_LOCATIONS, LoadLocationsCommand);
        }
    }
}