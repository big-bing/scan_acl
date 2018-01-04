class ScanAcl::CharactersController < ScanAcl::ApplicationController

  before_action :load_corporation

  ACL = {
    type: 'common',
    module: '角色权限',
    node: '角色管理',
    acl: [
      { display_name: '展示', actions: [:index], unchangeable_name: 'DISPLAY' },
      { display_name: '新增,修改,操作', actions: [ :edit, :update, :new, :create], unchangeable_name: 'MODIFY' }
    ]
  }

  def index
    # @characters = ScanAcl::Character.ransack(name_cont: request_params[:q], id_eq: request_params[:id], corporation_id_eq: @corporation.id).result.order(id: :asc).page(request_params[:page]).per(per_page)
    @characters = ScanAcl::Character.ransack(name_cont: request_params[:q], id_eq: request_params[:id]).result.order(id: :asc).page(request_params[:page]).per(per_page)
    render 'characters/index'
  end

  def new
    @character = Character.new
    @ability_groups = AbilityGroup.all
  end

  def edit
    @character = Character.find(request_params[:id])
    @ability_groups = AbilityGroup.all
  end

  def create
    request_params[:character][:corporation_id] = @corporation.id
    @character = Character.new character_params
    if @character.save
      flash[:succeed] = "创建成功！"
    else
      @errors = @character.errors.full_messages.join("<br/> ")
    end
  end

  def update
    @character = Character.find(request_params[:id])
    if @character.update(character_params)
      flash[:succeed] = "更新成功！"
    else
      @errors = @character.errors.full_messages.join("<br/> ")
    end
  end

  private

  def define_inner_menu
    self.inner_menu_tpl = "shared/inner_menus/characters"
    self.inner_menu_url = '/characters'
    self.context_menu_url = '/characters'
  end

  def request_params
    request.parameters
  end

  def character_params
    request_params.require(:character).permit(:name, :desc, :corporation_id, ability_group_ids: [])
  end

  def load_corporation
    subdomain = request.subdomains.length > 0 ? request.subdomains[-2] : request.host
    @corporation = Corporation.find_by(domain: subdomain)
  end

end
