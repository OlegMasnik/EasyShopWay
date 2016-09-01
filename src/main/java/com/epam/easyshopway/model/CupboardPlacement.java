package com.epam.easyshopway.model;

import com.epam.easyshopway.dao.transformer.annotation.Column;

public class CupboardPlacement {
	@Column("id")
	private Integer id;

	@Column("map_id")
	private Integer mapId;

	@Column("cupboard_id")
	private Integer cupboardId;

	@Column("x_start")
	private Integer xStart;

	@Column("y_start")
	private Integer yStart;

	@Column("x_end")
	private Integer xEnd;

	@Column("y_end")
	private Integer yEnd;

	public CupboardPlacement() {
		super();
	}

	public CupboardPlacement(Integer id, Integer mapId, Integer cupboardId, Integer xStart, Integer yStart,
			Integer xEnd, Integer yEnd) {
		super();
		this.id = id;
		this.mapId = mapId;
		this.cupboardId = cupboardId;
		this.xStart = xStart;
		this.yStart = yStart;
		this.xEnd = xEnd;
		this.yEnd = yEnd;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMapId() {
		return mapId;
	}

	public void setMapId(Integer mapId) {
		this.mapId = mapId;
	}

	public Integer getCupboardId() {
		return cupboardId;
	}

	public void setCupboardId(Integer cupboardId) {
		this.cupboardId = cupboardId;
	}

	public Integer getxStart() {
		return xStart;
	}

	public void setxStart(Integer xStart) {
		this.xStart = xStart;
	}

	public Integer getyStart() {
		return yStart;
	}

	public void setyStart(Integer yStart) {
		this.yStart = yStart;
	}

	public Integer getxEnd() {
		return xEnd;
	}

	public void setxEnd(Integer xEnd) {
		this.xEnd = xEnd;
	}

	public Integer getyEnd() {
		return yEnd;
	}

	public void setyEnd(Integer yEnd) {
		this.yEnd = yEnd;
	}

}
