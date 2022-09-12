# 補足 - GitHubのMarkdown実装

[付録: A parsing strategy](appendix-a-parsing-strategy.md)
← [目次](index.md)

------------------------------------------------------------------------

実はGitHubのMarkdown実装はGFM完全準拠ではなく、独自拡張仕様もあれば、逆にGFMと異なる動作や未実装仕様も存在する。

TODO

## GFM仕様との違い

GitHubのMarkdown実装はGitHubサイト運用で継続的に手が加えられており、今ではGFM仕様にはない独自機能が多数存在する。



日々変化する性質のものなので、


### 脚注


## GFM準拠チェック


> ここからTODO: 現実のGitHubサイトはGFM仕様に完全準拠しているわけではなく、独自拡張もあれば逆に未実装部分もある。ただし習得中はまだ考えなくてよい。
> 
> > (補足: これはここではなく、Appendix Bとかに回した方が思う) この点に関しては次のドキュメントが詳しい。特に後半部の[GFMとGitHub実装の違い](https://qiita.com/tk0miya/items/6b81e0e4563199037018#githubcom-の動作と合致していない)や[GitHub独自拡張の解説](https://qiita.com/tk0miya/items/6b81e0e4563199037018#gfm-に記載されていない-githubcom-独自のマークアップが存在する)は要チェック。
> > 
> > https://qiita.com/tk0miya/items/6b81e0e4563199037018
> > 
> > またGitHubにpushしたMarkdown出力では見出し要素に対してIDが自動的に割り振られる。これもTODO。規則はだいたい分かっているが、明記された公式ドキュメントはどうやらない模様。本ドキュメントのどこかにきちんとまとめておきたい。これもAppendixとかの方がいいと思う。

------------------------------------------------------------------------

[付録: A parsing strategy](appendix-a-parsing-strategy.md)
← [目次](index.md)
