import {Column, Entity, OneToMany} from "typeorm";
import {BaseModel} from "./BaseModel";
import {LwNewsTrace} from "./LwNewsTrace";

@Entity({name: "lw_news"})
export class LwNews extends BaseModel {
    @Column({name: "id"})
    public id: number;

    @Column({name: "title"})
    public title: string;

    @Column({name: "description"})
    public description: string;

    @Column({name: "total_like"})
    public totalLike: string;

    @Column({name: "total_views"})
    public totalViews: string;

    @Column({name: "create_uid"})
    public createUid: string;

    @Column({name: "write_uid"})
    public writeUid: number;

    @Column({name: "write_date"})
    public writeDate: Date;

    @Column({name: "image_url_list"})
    public imageUrlList: string;

    @OneToMany(type => LwNewsTrace, lwNewsTrace => lwNewsTrace.newsId)
    lwNewsTraces: LwNewsTrace[]

}
