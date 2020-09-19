import {
    Column,
    CreateDateColumn,
    Entity,
    ManyToOne,
    PrimaryColumn,
    UpdateDateColumn,
} from "typeorm";
import {LwNews} from "./LwNews";
import {IsDate} from "class-validator";


@Entity({name: "lw_news_trace"})
export class LwNewsTrace{

    @PrimaryColumn({name: "news_id"})
    public newsId: number;

    @Column({name: "partner_id"})
    public partnerId: number;

    @Column({name: "read_flg"})
    public readFlg: boolean;

    @Column({name: "like_flg"})
    public likeFlg: boolean;

    @Column({name: "create_uid"})
    public createUid: string;

    @Column({name: "write_uid"})
    public writeUid: string;

    @IsDate()
    @CreateDateColumn()
    createDate!: Date;

    @IsDate()
    @UpdateDateColumn()
    writeDate!: Date;

    @ManyToOne(type => LwNews, lwNews => lwNews.lwNewsTraces)
    lwNews: LwNews

}
