{jmessage_bootstrap}
  <h1>{@admin~admin.configuration.h1@}</h1>

  {ifacl2 'lizmap.admin.services.view'}
  <!--Services-->
  <div>
    <h2>{@admin~admin.configuration.services.label@}</h2>
    <dl>
      <dt>{@admin~admin.configuration.services.wmsServerURL.label@}</dt><dd>{$lizmapConfig->wmsServerURL}</dd>
      <dt>{@admin~admin.configuration.services.cacheStorageType.label@}</dt><dd>{$lizmapConfig->cacheStorageType}</dd>
      <dt>{@admin~admin.configuration.services.cacheExpiration.label@}</dt><dd>{$lizmapConfig->cacheExpiration}</dd>
      <dt>{@admin~admin.configuration.services.defaultRepository.label@}</dt><dd>{$lizmapConfig->defaultRepository}</dd>
    </dl>
    
    <!-- Modify -->
    {ifacl2 'lizmap.admin.services.update'}
    <div class="form-actions">
    <a class="btn" href="{jurl 'admin~config:modifyServices'}">
      {@admin~admin.configuration.button.modify.service.label@}
    </a>
    </div>
    {/ifacl2}
  </div>
  {/ifacl2}

  {ifacl2 'lizmap.admin.repositories.view'}
  <!--Repositories-->
  <div>
  <h2>{@admin~admin.configuration.repository.label@}</h2>
  {foreach $lizmapConfig->repositoryList as $repo}
   
    <legend>{$repo}</legend>
    
    {if isset($lizmapConfig->lizmapConfigData['repository:'.$repo]) }
    <dl><dt>{@admin~admin.form.admin_section.data.label@}</dt>
      <dd>
        <table class="table">
      {assign $section = 'repository:'.$repo}
      {assign $item = $lizmapConfig->lizmapConfigData[$section]}
      {foreach $item as $key=>$val}
      <tr>
        <th>{$key}</th><td>{$val}</td>
      </tr>
      {/foreach}
        </table>
      </dd>
    </dl>

    <dl><dt>{@admin~admin.form.admin_section.groups.label@}</dt>
      <dd>
        <table class="table">
      {foreach $data[$repo] as $k}
      <tr>
        <th>{$labels[$k->id_aclsbj]}</th><td>{$k->group_names}</td>
      </tr>
      {/foreach}
        </table>
      </dd>
    </dl>

      <div class="form-actions">
        <!-- View repository page -->
        {ifacl2 'lizmap.repositories.view', $repo}
        <a class="btn" href="{jurl 'view~default:index', array('repository'=>$repo)}" target="_blank">{@admin~admin.configuration.button.view.repository.label@}</a>
        {/ifacl2}
        <!-- Modify -->
        {ifacl2 'lizmap.admin.repositories.update'}
        <a class="btn" href="{jurl 'admin~config:modifySection', array('repository'=>$repo)}">{@admin~admin.configuration.button.modify.repository.label@}</a>
        {/ifacl2}
        <!-- Remove -->
        {ifacl2 'lizmap.admin.repositories.delete'}
        <a class="btn" href="{jurl 'admin~config:removeSection', array('repository'=>$repo)}" onclick="return confirm('{@admin~admin.configuration.button.remove.repository.confirm.label@}')">{@admin~admin.configuration.button.remove.repository.label@}</a>
        {/ifacl2}
        {ifacl2 'lizmap.admin.repositories.delete'}
        <a class="btn" href="{jurl 'admin~config:removeCache', array('repository'=>$repo)}" onclick="return confirm('{@admin~admin.cache.button.remove.repository.cache.confirm.label@}')">{@admin~admin.cache.button.remove.repository.cache.label@}</a>
        {/ifacl2}
      </div>
      
    {/if}
  {/foreach}    
  </div>
  {/ifacl2}

<!--Add a repository-->
{ifacl2 'lizmap.admin.repositories.create'}
<a class="btn" href="{jurl 'admin~config:createSection'}">{@admin~admin.configuration.button.add.repository.label@}</a>
{/ifacl2}
