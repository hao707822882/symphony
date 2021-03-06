<#include "macro-home.ftl">
<#include "../macro-pagination.ftl">
<@home "${type}">
<div class="tabs-sub fn-clear">
    <a href="${servePath}/member/${user.userName}/following/users"<#if type == "followingUsers"> class="current"</#if>>${followingUsersLabel}</a>
    <a href="${servePath}/member/${user.userName}/following/tags"<#if type == "followingTags"> class="current"</#if>>${followingTagsLabel}</a>
    <a href="${servePath}/member/${user.userName}/following/articles"<#if type == "followingArticles"> class="current"</#if>>${followingArticlesLabel}</a>
    <a href="${servePath}/member/${user.userName}/followers"<#if type == "followers"> class="current"</#if>>${followersLabel}</a>
</div>
<#if 0 == user.userFollowingArticleStatus || (isLoggedIn && ("adminRole" == currentUser.userRole || currentUser.userName == user.userName))>
<div class="list">
    <ul class="fn-clear">
        <#list userHomeFollowingArticles as article>
        <li class="fn-flex read">
            <#if "someone" != article.articleAuthorName>
            <a aria-label="${article.articleAuthorName}" class="tooltipped tooltipped-s"
               target="_blank" rel="nofollow" href="${servePath}/member/${article.articleAuthorName}"></#if>
                <div class="avatar" style="background-image:url('${article.articleAuthorThumbnailURL}')"></div>
            <#if "someone" != article.articleAuthorName></a></#if>
            <div class="fn-flex-1 has-view">
                <h2>
                    <#if 1 == article.articlePerfect>
                    <span class="tooltipped tooltipped-n" aria-label="${perfectLabel}"><svg height="20" viewBox="3 0 11 12" width="14">${perfectIcon}</svg></span>
                    </#if>
                    <#if 1 == article.articleType>
                    <span class="tooltipped tooltipped-n" aria-label="${discussionLabel}"><span class="icon-locked"></span></span>
                    <#elseif 2 == article.articleType>
                    <span class="tooltipped tooltipped-n" aria-label="${cityBroadcastLabel}"><span class="icon-feed"></span></span>
                    <#elseif 3 == article.articleType>
                    <span class="tooltipped tooltipped-n" aria-label="${thoughtLabel}"><span class="icon-video"></span></span>
                    </#if>
                    <a rel="bookmark" href="${servePath}${article.articlePermalink}">${article.articleTitleEmoj}</a>
                </h2>
                <span class="ft-gray">
                    <#list article.articleTags?split(",") as articleTag>
                    <a rel="tag" class="tag" href="${servePath}/tag/${articleTag?url('UTF-8')}">
                        ${articleTag}</a>
                    </#list> &nbsp; 
                    <span class="icon-date"></span>
                    ${article.articleCreateTime?string('yyyy-MM-dd HH:mm')}
                </span> 
            </div>
            <#if article.articleCommentCount != 0>
            <div class="cmts tooltipped tooltipped-w" aria-label="${cmtLabel}${quantityLabel}">
                <a class="count ft-gray" href="${servePath}${article.articlePermalink}">${article.articleCommentCount}</a>
            </div>
            </#if>
        </li>
        </#list>
    </ul>
</div>
<@pagination url="/member/${user.userName}/following/tags"/>
<#else>
<p class="ft-center ft-gray home-invisible">${setinvisibleLabel}</p>
</#if>
</@home>