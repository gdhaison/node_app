import moment from "moment";

export class DateUtils {
    static dateToString(date: Date, format: string) {
        return moment(date).format(format);
    }
}
